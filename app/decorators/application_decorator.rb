class ApplicationDecorator < Draper::Decorator
  include Draper::LazyHelpers

  def self.collection_decorator_class
    PaginationDecorator
  end

  def created_at
    localize object.created_at, format: :long if object.created_at.present?
  end

  def updated_at
    localize object.updated_at, format: :long if object.updated_at.present?
  end

  def state
    status_tag object.state if object.state.present?
  end

  def type
    content_tag :code, object.type if object.type.present?
  end

  def slug
    content_tag :code, object.slug if object.slug.present?
  end

  def url
    link_to_unless object.url.blank?, object.url, object.url, target: '_blank' if object.url.present?
  end

  protected
  def status_tag(*args)
    raw ActiveAdmin::Views::StatusTag.new.status_tag(*args).html_safe
  end
end
