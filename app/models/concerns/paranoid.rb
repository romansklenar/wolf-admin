module Paranoid
  extend ActiveSupport::Concern

  included do
    extend ClassMethods
    include InstanceMethods

    scope :without_deleted, -> { where(deleted_at: nil) }
    scope :with_deleted, -> { unscope(where: :deleted_at) }
    scope :only_deleted, -> { with_deleted.where.not(deleted_at: nil) }
    default_scope { without_deleted }
  end

  module ClassMethods
    def restore(id)
      Array(id).flatten.map { |one_id| only_deleted.find(one_id).restore! }
    end
  end

  module InstanceMethods
    def destroy!
      run_callbacks(:destroy) { delete! }
    end
    alias :destroy :destroy!

    def delete!
      return if new_record? || destroyed?
      self.class.unscoped do
        update_column(:deleted_at, Time.now)
      end
    end
    alias :delete :delete!

    def restore!
      self.class.unscoped do
        write_attribute(:deleted_at, nil)
        update_column(:deleted_at, nil)
      end
    end
    alias :restore :restore!

    def destroyed?
      !self.deleted_at.nil?
    end
    alias :deleted? :destroyed?

    def paranoid?
      true
    end

    # If a paranoid record is selected, then we only want to check
    # if it's a new record, not if it is "destroyed".
    def persisted?
      paranoid? ? !new_record? : super
    end
  end
end
