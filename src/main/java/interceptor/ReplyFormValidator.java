package interceptor;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class ReplyFormValidator extends Validator{
    @Override
    protected void validate(Controller controller) {
        String contents = controller.getPara("contents");
        if (contents.isEmpty()) {
                addError("error", "回帖内容不能为空");
        }
    }
    @Override
    protected void handleError(Controller controller) {
            controller.renderHtml("回帖名称不能为空" + "<br><a href='/index'> 返回主页面</a>");
    }

}
