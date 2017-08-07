<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<div class="row">
    <div class=" create-faq-wrap colored-block">
        <div class="create-faq-title">Create new FAQ</div>
        <form class="create-faq" action="${pageContext.servletContext.contextPath}/controller" style="display: none" method="POST">
            <input type="hidden" name="command" value="create_faq"/>
            <input class="input-text" type="text" name="question" value="Type question"
                   onfocus="if(this.value==this.defaultValue)this.value='';"
                   onblur="if(this.value=='')this.value=this.defaultValue;">
            <textarea class="input-text text-area" name="answer" cols="0" rows="0"
                      onfocus="if(this.value==this.defaultValue)this.value='';"
                      onblur="if(this.value=='')this.value=this.defaultValue;">Type answer</textarea>
            <input class="input-btn" type="submit" value="create">
        </form>
    </div>
</div>
<article class="row">
    <div class="colored-block">
        <div class="faq-wrap">
            <c:forEach var="item" items="${faqList}">
                <form class="faq-item clearfix">
                    <div class="clearfix">
                        <div class="faq-item-title" id="faq_title_${item.id}">${item.question}</div>
                        <div class="btn-group faq-edit-btn-group clearfix">
                            <button type="button" class="btn-edit"><span class="glyphicon glyphicon-pencil"></span>
                            </button>
                            <button type="button" class="btn-delete"><span class="glyphicon glyphicon-trash"></span>
                            </button>
                        </div>
                    </div>
                    <div class="faq-item-answer" id="faq_answer_${item.id}" style="display: none">${item.answer}</div>
                </form>
            </c:forEach>
        </div>
    </div>
</article>
<div class="popup-wrap" id="edit-faq-popup">
    <div class="popup-holder edit-faq-holder" id="edit-faq" style="display: none">
        <form class="edit-faq-form clearfix" action="${pageContext.servletContext.contextPath}/controller" method="POST">
            <input type="hidden" name="command" value="edit_faq"/>
            <input class="input-text" type="text" name="edit_question" id ="edit-faq-question" value="" readonly="readonly">
            <textarea class="input-text text-area" name="edit_answer" id="edit-faq-answer" cols="0" rows="0"></textarea>
            <div class="btn-group">
                <input type="submit" value='Сохранить'>
                <input class="edit-faq-close" type="button" value='Отмена'>
            </div>
        </form>
        <div class="popup-close edit-faq-close"><a href="">x</a></div>
    </div>
</div>
<div class="popup-wrap" id="delete-faq-popup">
    <div class="popup-holder delete-faq-holder" id="delete-faq" style="display: none">
        <form class="delete-faq-form clearfix" action="${pageContext.servletContext.contextPath}/controller" method="POST">
            <input type="hidden" name="command" value="delete_faq"/>
            <h3>Вы действительно хотите удаить следующий элемент?</h3>
            <input class="input-text" type="text" name="delete_question" id ="delete-faq-question" value="" >
            <div class="btn-group">
                <input type="submit" value='Удалить'>
                <input class="delete-faq-close" type="button" value='Отмена'>
            </div>
        </form>
        <div class="popup-close delete-faq-close"><a href="">x</a></div>
    </div>
</div>