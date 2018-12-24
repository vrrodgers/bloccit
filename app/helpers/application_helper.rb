module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?

    content_tag :div, capture(&block), class: css_class
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end

  def voteup_status_color vote
    if vote.present?
     'color: grey;' if vote.value == 1
    end
  end

  def votedown_status_color vote
    if vote.present?
      'color: grey;' if vote.value == -1
    end
  end
end
