<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | Turo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <style>
        h4 {
            font-family: Alata, sans-serif;
        }

        .course-display-grid-box {
            width: 100%;
            height: auto;
            min-height: 10rem;

            display: grid;
            grid-auto-flow: row;
            grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
            gap: 2rem 3vw;
        }

        .course-menu {
            margin: 0;
            border-radius: 0.4rem;
            width: 100%;
            font-size: 30px;
            text-align: center;
            box-shadow: 0rem 0rem 12rem -3rem rgba(0, 0, 0, 0.8) inset, 2rem -6rem 20rem -2rem rgba(0, 0, 0, 1) inset;
            filter: drop-shadow(0 0.2rem 0.25rem rgba(0, 0, 0, 0.2));
            cursor: pointer;
            background-size: cover;
            background-position: right top;

            display: flex;
            flex-direction: column;

            transition: all 0.3s ease 0s;
        }

        .course-menu:hover {
            filter: drop-shadow(0 0.2rem 0.4rem rgba(0, 0, 0, 0.5));
            transform: translate(0, -0.15rem);
            transition: all 0.3s ease 0s;
        }

        .course-filler {
            height: 9rem;

            display: flex;
            flex-direction: column;
        }

        .course-details {
            height: 5rem;
            padding: 1rem 1rem;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .course-header {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: flex-end;
        }

        .course-teacher {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            justify-content: flex-end;
        }

        .course-title,
        .course-desc {
            color: #FFFFFF;
            margin: 0;
            padding: 0;
            font-family: Alexandria, sans-serif;
            font-weight: 500;
        }

        .course-desc {
            font-size: 0.8rem;
            font-weight: 300;
        }

        a.module-link {
            text-decoration: none;
            width: 20rem;
            height: 14rem;
        }
    </style>
</head>

<body>
    <header class="main-header">
        <a href="/home-tutor"><img src="/icons/title-logo.svg" width="120em" height="auto"></a>
        <div class="navbar-user">
            <span style="color: white; font-family: Alexandria, sans-serif;">
                Welcome, Test
            </span>
        </div>
        <nav>
            <div class="nav__links">
                <a class="nav" href="/home-tutor">COURSES</a>
                <a class="nav" href="/performance">PERFORMANCE</a>
                <a class="nav" href="#">LEADERBOARDS</a>
                <a class="nav" href="#">CALENDAR</a>
                <a class="nav" href="#">INBOX</a>
                <div class="dropdown">
                    <!-- Trigger element: background-image div -->
                    <div
                        class="svg navbar-img-container dropdown-toggle"
                        style="background-image: url('/icons/no-img.jpg'); width: 2.5em; height: 2.5em; background-size: cover; background-position: center; border-radius: 50%; cursor: pointer;"
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

    <div class="home-tutor-screen">
        <div class="home-tutor-main">
            <h4>Dashboard - Courses</h4>
            <div class="return-prev-cont">
                <?= '<a class="activity-link" href="#"> ' ?>
                <div class="return-prev">BACK Page</div>
                        </a>
                </div>
            </div>
            <hr>
        </div>
        <?php include('partials/right-side-notifications.php'); ?>
    </div>
</body>
</html>