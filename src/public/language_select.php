<div>


    <?php
    if (isset($_POST["knop"])) {
        // Each number corresponds to a language. 0 = English, 1 = Nederlands, 2 = Français.

        $_SESSION["lang"] = $_POST["radio-lang"];

        $success_msg = array("You have successfully switched the website's language to English.", "U hebt succesvol de taal van de website veranderd.", "Vous avez changé le langue de site web avec succès.");
        echo $success_msg[$_SESSION["lang"]];

    } else {
        echo '
            <form method="post" action="language_select.php">
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