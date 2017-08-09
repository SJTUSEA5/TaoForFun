package action;

import java.util.List;

import model.Weibo;
import service.WeiboService;

public class AllWeibosAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private WeiboService weiboService;

	public void setweiboService(WeiboService weiboService) {
		this.weiboService = weiboService;
	}

	@Override
	public String execute() throws Exception {
		List<Weibo> weibos = weiboService.getAllWeibo();
		request().setAttribute("weibos", weibos);
		return SUCCESS;
	}
}
