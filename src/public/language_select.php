<div>


    <?php
    if (isset($_POST["knop"])) {
        
    } else {
        echo '
            <form method="post" action="language_select.php">
                <div class="form-control">
                    <label class="label cursor-pointer">
                    <span class="label-text">English</span> 
                    <input type="radio" name="radio-lang" class="radio checked:bg-blue-500" checked />
                    </label>
                </div>
                <div class="form-control">
                    <label class="label cursor-pointer">
                    <span class="label-text">Nederlands</span> 
                    <input type="radio" name="radio-lang" class="radio checked:bg-blue-500" checked />
                    </label>
                </div>
                <div class="form-control">
                    <label class="label cursor-pointer">
                    <span class="label-text">Français</span> 
                    <input type="radio" name="radio-lang" class="radio checked:bg-blue-500" checked />
                    </label>
                </div>
                <input type="submit" name="knop" value="Change" class="btn btn-active btn-primary">
            </form>
        ';
    }
    ?>

</div>