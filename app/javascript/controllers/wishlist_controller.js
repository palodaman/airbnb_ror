import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    updateWishlistStatus() {
        //get status is user is logged in
        //if logged out, redirect to login page, return
        //else continue
        const isUserLoggedIn = this.element.dataset.userLoggedIn;
        if (isUserLoggedIn === "false") {
            document.querySelector(".js-login").click(); //clicks eleement withthe class js-login which is the login button
            return
        }

        // for toggling, get data status. default status is fault, so unliked property would be false and empty at first
        //the status is a string even tho true or false
        if (this.element.dataset.status === "false") {
            this.element.classList.remove("fill-none");
            this.element.classList.add("fill-primary");
            this.element.dataset.status = "true";
        }
        else {
            this.element.classList.remove("fill-primary");
            this.element.classList.add("fill-none");
            this.element.dataset.status = "false";
        }
    }
} 