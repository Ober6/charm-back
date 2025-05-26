package org.ober6.charm.back;

import org.ober6.charm.back.controller.ProfileController;
import org.ober6.charm.back.dao.ProfileDao;
import org.ober6.charm.back.service.ProfileService;

import java.net.ServerSocket;
import java.io.IOException;
import java.net.Socket;
import java.io.DataInputStream;
import java.io.DataOutputStream;

import static org.ober6.charm.back.model.Commands.*;

public class CharmBackServerRunner {
    public static void main(String[] args) throws IOException {

        ProfileController controller = new ProfileController(new ProfileService(new ProfileDao()));
        CharmHttpServer server = new CharmHttpServer(5);
        server.start();
    }
}
