<div>


    <?php
    if (isset($_POST["knop"])) {
        // Each number corresponds to a language. 0 = English, 1 = Nederlands, 2 = Français.

        $_SESSION["lang"] = $_POST["radio-lang"];
        $lng = $_SESSION["lang"];

        $txt_success = array("You have successfully switched the website's language to English.", "U hebt succesvol de taal van de website veranderd.", "Vous avez changé le langue de site web avec succès.");
        echo '
            <div class="alert alert-success">
                <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
                <span>'.$txt_success[$lng].'</span>
            </div>
        ';

        header("Location: /");

    } else {
        echo '
            <form method="post" action="language-select">
                <div class="form-control">
                    <label class="label cursor-pointer">
                    <span class="label-text">English</span> 
                    <input type="radio" name="radio-lang" value=0 class="radio checked:bg-blue-500" checked />
                    </label>
                </div>
                <div class="form-control">
                    <label class="label cursor-pointer">
                    <span class="label-text">Nederlands</span> 
                    <input type="radio" name="radio-lang" value=1 class="radio checked:bg-blue-500" checked />
                    </label>
                </div>
                <div class="form-control">
                    <label class="label cursor-pointer">
                    <span class="label-text">Français</span> 
                    <input type="radio" name="radio-lang" value=2 class="radio checked:bg-blue-500" checked />
                    </label>
                </div>
                <input type="submit" name="knop" value="Change" class="btn btn-active btn-primary">
            </form>
        ';
    }
    ?>

</div>