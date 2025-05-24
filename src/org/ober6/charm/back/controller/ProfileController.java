package org.ober6.charm.back.controller;

import org.ober6.charm.back.model.Profile;
import org.ober6.charm.back.service.ProfileService;

import java.util.Optional;

public class ProfileController {

    private final ProfileService service;

    public ProfileController(ProfileService service) {
        this.service = service;
    }

    public String work(String request) {
        return null;
    }

    public String save(String save) {
        String[] params = save.split(",");
        if (params.length != 4) return "Bad request: need 4 parameters to save profile.";

        Profile profile = new Profile();
        profile.setEmail(params[0]);
        profile.setName(params[1]);
        profile.setSurname(params[2]);
        profile.setAbout(params[3]);

        return service.save(profile).toString();
    }

    public String findById(String request) {
        String[] strings = request.split(",");
        if (strings.length != 1) return "Bad request: need 1 number parameter.";

        long id;
        try {
            id = Long.parseLong(strings[0]);
        } catch (NumberFormatException e) {
            return "Bad request: can't parse String" + strings[0] + "to long";
        }

        Optional<Profile> maybeProfile = service.findById(id);
        return maybeProfile.isEmpty() ? "Not found" : maybeProfile.get().toString();
    }

    public String findAll() {
        return service.findAll().toString();
    }

    public String update(String request){
        String[] strings = request.split(", ");
        if(strings.length != 5) return "Bad request: need 5 parameters to update profile";

        long id;
        try{
            id = Long.parseLong(strings[0]);
        }catch(NumberFormatException e){
            return "Bad request: can't parse string ["+strings[0]+"] ro long";
        }

        Profile profile= new Profile();
        profile.setId(id);
        profile.setEmail(strings[1]);
        profile.setName(strings[2]);
        profile.setSurname(strings[3]);
        profile.setAbout(strings[4]);

        service.update(profile);
        return null;
    }

    public String delete(String request){
        String[] strings = request.split(", ");
        if(strings.length != 1) return "Bad request: need one parameter to delete profile";
        long id;
        try{
            id = Long.parseLong(strings[0]);
        } catch(NumberFormatException e){
            return "Bad request: can't parse string [" + strings[0] + "] to long";
        }
        service.delete(id);
        return "Delete success";
    }

}
