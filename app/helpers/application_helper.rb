module ApplicationHelper
	def submit_button_text
		if controller_name == 'lists' && action_name == 'new'
	  	'Ajouter la liste'
		else
	  	'Enregistrer'
		end
  	end
	  
	def should_show_new_list_link?
		(controller_name == 'lists' && action_name == 'index') || (controller_name == 'home' && action_name == 'index')
	end
end
