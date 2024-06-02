# frozen_string_literal: true

module ApplicationHelper
  def confirmation_link_message
    tag.p(class: 'bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded relative', role: 'alert') do
      link_here = link_to(
        I18n.t('account_activations.activation_link'),
        account_activations_url,
        data: { turbo_method: :create },
        class: 'font-semibold text-sky-600 underline'
      )

      I18n.t('account_activations.unconfirmed', activation_link: link_here).html_safe
    end
  end
end
