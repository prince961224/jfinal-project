package controller;

import com.jfinal.core.Controller;

public class MainController extends Controller {

    public void index(){
        renderFreeMarker("index.ftl");
    }
}
