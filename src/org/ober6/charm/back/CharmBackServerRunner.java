package org.ober6.charm.back;

import org.ober6.charm.back.controller.LikeController;
import org.ober6.charm.back.controller.ProfileController;
import org.ober6.charm.back.dao.ProfileDao;
import org.ober6.charm.back.service.ProfileService;

import java.io.IOException;

public class CharmBackServerRunner {
    public static void main(String[] args) throws IOException {
        ProfileController profileController = new ProfileController(new ProfileService(new ProfileDao()));

        LikeController likeController = new LikeController();
        CharmHttpServer server = new CharmHttpServer(8080, 5, profileController,likeController);
        server.start();
    }
}