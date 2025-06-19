<?php
function getMimeTypeFromBlob($blob)
{
    $finfo = new finfo(FILEINFO_MIME_TYPE);
    return $finfo->buffer($blob);
}
?>

<header>
    <a href="/home-tutor"><img src="/icons/title-logo.svg" width="120em" height="auto"></a>
    <div class="navbar-user">
        <?php if (session()->has('user_id')): ?>
            <span style="color: white; font-family: Alexandria, sans-serif;">
                Welcome, <?= session('user_name') ?>
            </span>
        <?php endif; ?>
    </div>
    <nav>
        <div class="nav__links">
            <a class="nav" href="/home-tutor">COURSES</a>
            <a class="nav" href="/performance">PERFORMANCE</a>
            <a class="nav" href="#">LEADERBOARDS</a>
            <a class="nav" href="#">CALENDAR</a>
            <a class="nav" href="#">INBOX</a>
            <?php
            if (empty($users->image?->image)) {;
                $imageURL = "/icons/no-img.jpg";
            } else {
                $blobData = $users->image?->image;
                $mimeType = getMimeTypeFromBlob($blobData);
                $base64Image = base64_encode($blobData);
                $imageURL = "data:$mimeType;base64,$base64Image";
            } ?>

            <div class="dropdown">
                <!-- Trigger element: background-image div -->
                <div
                    class="svg navbar-img-container dropdown-toggle"
                    style="background-image: url('<?= $imageURL ?>'); width: 2.5em; height: 2.5em; background-size: cover; background-position: center; border-radius: 50%; cursor: pointer;"
                    data-bs-toggle="dropdown"
                    aria-expanded="false">
                </div>

                <!-- Dropdown menu -->
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="/profile">Profile</a></li>
                    <hr style="width: 100%; margin-top: 0.5em; margin-bottom: 0.5em;">
                    <li><a class="dropdown-item" href="/logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>