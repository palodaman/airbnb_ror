import {Controller} from "@hotwired/stimulus" 
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
    
    static targets = ['dropdown', 'openUserMenu']

    //default method that gets called
    connect(){
        console.log("enter", enter);
        this.openUserMenuTarget.addEventListener("click", (e)=>{
            openDropDown(this.dropdownTarget)
        })
    }
}

function openDropDown(element) {
    toggle(element).then(() => {
        console.log("enter a transition complete")
    })
}

//remove element when close
function closeDropDown(){
    leave(this.dropdownTarget).then(() => {
        element.destroy();
    })
}