package com.epam.bets.command;

import com.epam.bets.command.admin.*;
import com.epam.bets.command.bookmaker.CreateMatchCommand;
import com.epam.bets.command.bookmaker.EditMatchCommand;
import com.epam.bets.command.bookmaker.EditMatchResultCommand;
import com.epam.bets.command.bookmaker.SetMatchScoreCommand;

public enum CommandType {
    SIGN_IN(new SignInCommand()),
    SIGN_UP(new SignUpCommand()),
    LOG_OUT(new LogOutCommand()),
    SHOW_PIECE_OF_NEWS(new ShowPieceOfNewsCommand()),
    SHOW_FAQ(new ShowFAQCommand()),
    SHOW_USER_PROFILE(new ShowUserProfileCommand()),
    EDIT_PROFILE(new EditProfileCommand()),
    EDIT_USER_AVATAR(new EditUserAvatarCommand()),
    CREATE_FAQ(new CreateFAQCommand()),
    EDIT_FAQ(new EditFAQCommand()),
    DELETE_FAQ(new DeleteFAQCommand()),
    CREATE_NEWS(new CreateNewsCommand()),
    EDIT_NEWS(new EditNewsCommand()),
    EDIT_NEWS_PICTURE(new EditNewsPictureCommand()),
    DELETE_NEWS(new DeleteNewsCommand()),
    CREATE_MATCHES_PAGE(new CreateMatchesPageCommand()),
    CREATE_MATCH(new CreateMatchCommand()),
    EDIT_MATCH(new EditMatchCommand()),
    SET_SCORE(new SetMatchScoreCommand()),
    EDIT_RESULTS(new EditMatchResultCommand());
    private AbstractCommand command;

    CommandType(AbstractCommand command) {
        this.command = command;
    }

    public AbstractCommand getCommand() {
        return command;
    }
}
