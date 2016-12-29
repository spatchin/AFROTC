module ApplicationHelper
  def user_status(user)
    if user.invitation_sent_at.present? && user.invitation_accepted_at.nil?
      'Invitation Pending'
    else
      icon 'check' , style: 'color: green;'
    end
  end

  def subnav_img
    case request.fullpath
    when '/'
      '/color_guard.jpg'
    when '/cadre'
      '/cadre2016.jpg'
    when '/prospective'
      '/wk quiz.jpg'
    when '/aas'
      '/aas.jpg'
    when '/dtcg'
      '/cg.jpg'
    when '/alumni'
      '/commissioning.jpg'
    else
      nil
    end
  end
end
