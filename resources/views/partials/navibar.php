<header>
    <a href="/home-tutor"><img src="/icons/title-logo.svg" width="120em" height="auto"></a>
    <?php if (session()->has('user_id')): ?>
        <span style="color: white; font-family: Alexandria, sans-serif;">
            Welcome, <?= session('user_name') ?>
        </span>
    <?php endif; ?>
    <nav>
        <div class="nav__links">
            <a class="nav" href="#">PERFORMANCE</a>
            <a class="nav" href="#">LEADERBOARDS</a>
            <a class="nav" href="#">POINTS SHOP</a>
            <a class="nav" href="#">CALENDAR</a>
            <a class="nav" href="#">INBOX</a>
            <a class="nav" href="/logout">LOGOUT</a>
        </div>
    </nav>
</header>