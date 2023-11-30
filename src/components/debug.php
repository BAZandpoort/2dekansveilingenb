<!-- Debug Menu -->
<div tabindex="0" class="collapse z-50 fixed bottom-0 right-0 m-4 bg-white p-2 border border-gray-300 rounded shadow w-fit">
<input type="checkbox" class="peer" />     
<h2 class="collapse-title text-lg font-bold">Debug Menu</h2>
    <ul class="collapse-content space-y-2">
        <li>Server Info:
            <ul class="list-disc ml-4">
                <li>PHP Version: <?php echo phpversion(); ?></li>
                <li>Server Software: <?php echo $_SERVER['SERVER_SOFTWARE']; ?></li>
                <li>Server Name: <?php echo $_SERVER['SERVER_NAME']; ?></li>
                <li>Server Port: <?php echo $_SERVER['SERVER_PORT']; ?></li>
            </ul>
        </li>
        <?php if (isset($_SESSION['user'])): ?>
          <?php $user = $_SESSION['user']; ?>
          <li>User Info:
            <ul class="list-disc ml-4">
              <li>ID: <?php echo $user['id']; ?></li>
              <li>Username: <?php echo $user['username']; ?></li>
              <li>email: <?php echo $user['email']; ?></li>
            </ul>
        </li>
        <?php endif; ?>
        <li>Session Info:
            <ul class="list-disc ml-4">
                <li>Session ID: <?php echo session_id(); ?></li>
                <li>Session Name: <?php echo session_name(); ?></li>
                <li>Session Status: <?php echo session_status(); ?></li>
                <?php if (isset($_SESSION['fingerprint'])): ?>
                  <li>Session Fingerprint: <?php echo $_SESSION['fingerprint']; ?></li>
                <?php endif; ?>
                <?php
                  $browserFingerprint = generateFingerprint(
                    $_SERVER['REMOTE_ADDR'],
                    '1920x1080', // TODO: get screen resolution
                    $_SERVER['HTTP_USER_AGENT'],
                    $_SERVER['HTTP_ACCEPT_LANGUAGE'],
                    $_SERVER['HTTP_ACCEPT_ENCODING']
                  );
                  echo '<li>Browser Fingerprint: ' . $browserFingerprint . '</li>';
                    ?>

            </ul>
    </ul>
</div>