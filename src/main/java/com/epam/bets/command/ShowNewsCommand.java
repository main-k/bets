package com.epam.bets.command;

import com.epam.bets.entity.News;
import com.epam.bets.exception.ReceiverException;
import com.epam.bets.receiver.impl.NewsReceiverImpl;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static com.epam.bets.JspConstant.MAIN_PAGE;
import static com.epam.bets.JspConstant.NEWS_PAGE;


public class ShowNewsCommand implements AbstractCommand {

    private static final String PARAM_NAME_DATE = "date";
    private static final String PARAM_NAME_NEWS_LIST = "newsList";
    private static final String NEXT_PAGE = NEWS_PAGE;
    private static final String ERROR_PAGE = MAIN_PAGE;
    private static final String NO_NEWS_ERROR = "noNews";
    private static final String NO_NEWS_MESSAGE = "no_news";
    private static final Logger LOGGER = LogManager.getLogger(SignInCommand.class);
    private NewsReceiverImpl receiver = new NewsReceiverImpl();

    @Override
    public PageNavigator execute(HttpServletRequest request) {
        PageNavigator navigator = new PageNavigator(NEXT_PAGE, PageType.FORWARD);
        List<News> newsList;
        try {
            newsList = receiver.showAllNews(request.getParameter(PARAM_NAME_DATE));
            if (newsList != null && !newsList.isEmpty()) {
                request.setAttribute(PARAM_NAME_NEWS_LIST, newsList);
            } else {
                request.setAttribute(NO_NEWS_ERROR, NO_NEWS_MESSAGE);
                navigator.setPageUrl(ERROR_PAGE);
            }

        } catch (ReceiverException e) {
            LOGGER.log(Level.ERROR, e);
            request.setAttribute(NO_NEWS_ERROR, NO_NEWS_MESSAGE);
            navigator.setPageUrl(ERROR_PAGE);
        }
        return navigator;
    }
}