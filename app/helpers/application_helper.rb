module ApplicationHelper
  def user_status(user)
    if user.invitation_sent_at.present? && user.invitation_accepted_at.nil?
      'Invitation Pending'
    elsif user.confirmed_at.nil?
      'Confirmation Pending'
    else
      icon 'check' , style: 'color: green;'
    end
  end
end
