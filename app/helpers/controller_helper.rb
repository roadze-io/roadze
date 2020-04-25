module ControllerHelper
  def current_request?(*requests)
    requests.each do |request|
      next unless request[:controller] == controller.controller_name
      if request[:action].is_a?(Array) && request[:action].include?(controller.action_name)
        return true
 			end
      return true if request[:action] == controller.action_name
    end
    false
	end
	# current_request?(controller: 'users', action: ['new', 'create'])
end