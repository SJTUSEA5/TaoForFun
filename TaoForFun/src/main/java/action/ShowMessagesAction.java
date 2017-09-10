package action;

import java.util.ArrayList;
import java.util.List;

import model.Message;
import model.User;
import service.MessageService;

public class ShowMessagesAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	
	private MessageService messageService;
	
	public void setMessageService(MessageService messageService){
		this.messageService = messageService;
	}
	
	@Override
	public String execute() throws Exception {
		String username = ((User) session.get("user")).getUsername();
		List<Message> messages = new ArrayList<Message>();
		for(int i=0;i<messages.size();i++){
			    if(messageService.getMessageByAccepter(username)!=null)
				    messages=messageService.getMessageByAccepter(username);
			    else
			    	return "there are no new messages";
				}
		session().setAttribute("messages", messages);
		return SUCCESS;
	}
	
}
