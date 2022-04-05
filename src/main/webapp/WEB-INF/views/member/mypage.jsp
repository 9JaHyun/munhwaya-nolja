<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>        

            <div align="right" style="margin-bottom: 50px;"><h4>새소식${message}</h4></div>
            <div class="mbf clearfix">
                <div class="notification-box notification-box-success">
                    <p><i class="icon-ok"></i>새소식 1</p>
                    <a href="#" class="notification-close notification-close-success"><i
                            class="icon-remove"></i></a>
                </div>
                <div class="notification-box notification-box-info">
                    <p><i class="icon-ok"></i>새소식 2</p>
                    <a href="#" class="notification-close notification-close-info"><i
                            class="icon-remove"></i></a>
                </div>

                <div class="notification-box notification-box-error">
                    <p><i class="icon-ok"></i>새소식 3</p>
                    <a href="#" class="notification-close notification-close-error"><i
                            class="icon-remove"></i></a>
                </div>
                <div class="notification-box notification-box-warning">
                    <p><i class="icon-ok"></i>새소식 4</p>
                    <a href="#" class="notification-close notification-close-warning"><i
                            class="icon-remove"></i></a>
                </div>
            </div>
            <script>
            console.log(${message});
            	/* if(${message!=''}){
            		console.log(${message});
            		alert(${message});
            	} else{
            		
            	} */
            </script>
