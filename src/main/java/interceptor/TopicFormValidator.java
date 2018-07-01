package interceptor;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class TopicFormValidator extends Validator {

    @Override
    protected void validate(Controller controller) {
        String name = controller.getPara("name");
        if (name.isEmpty()) {
            addError("error", "贴子名称不能为空");
        }
    }

    @Override
    protected void handleError(Controller controller) {
        controller.renderHtml("贴子名称不能为空" + "<br><a href='/index'> 返回主页面</a>");
    }
}