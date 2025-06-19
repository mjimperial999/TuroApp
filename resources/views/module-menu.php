<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $course->course_name; ?> - Modules | Turo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <style>
        h4 {
            font-family: Alata, sans-serif;
        }

        .home-tutor-courses-header {
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: flex-end;
        }

        .home-tutor-courses-header h5 {
            margin: 0;
            padding: 0;
        }

        .featured-module {
            width: 20rem;
            height: 8rem;
            padding: 0;
            margin-bottom: 2rem;
            cursor: pointer;
            border-radius: 0.4rem;
            background-image: url('/uploads/course/math.jpg');
            background-size: cover;
            background-position: right top;
            box-shadow: 0rem 0rem 12rem -3rem rgba(0, 0, 0, 0.8) inset, 2rem -6rem 20rem -2rem rgba(0, 0, 0, 1) inset;
            filter: drop-shadow(0 0.2rem 0.25rem rgba(0, 0, 0, 0.2));
            transition: all 0.3s ease 0s;
        }

        .featured-module:hover {
            filter: drop-shadow(0 0.2rem 0.4rem rgba(0, 0, 0, 0.5));
            transform: translate(0, -0.15rem);
            transition: all 0.3s ease 0s;
        }

        .module-display-flex-box {
            width: 100%;
            padding: 0.5rem 0;
            margin-bottom: 1rem;
            height: auto;

            white-space: nowrap;
            display: flex;
            flex-direction: row;

            overflow-x: auto;
            scroll-behavior: smooth;

            gap: 0 1.5vw;
        }

        .module-menu {
            margin: 0;
            border-radius: 0.4rem;
            width: 16rem;
            height: 8rem;
            font-size: 30px;
            text-align: center;
            box-shadow: 0rem 0rem 6rem -3rem rgba(0, 0, 0, 0.8) inset, 2rem -6rem 12rem -2rem rgba(0, 0, 0, 1) inset;
            filter: drop-shadow(0 0.2rem 0.25rem rgba(0, 0, 0, 0.2));
            cursor: pointer;
            background-size: cover;
            background-position: center;

            display: flex;
            flex-direction: column;

            transition: all 0.3s ease 0s;
        }

        .module-menu:hover {
            filter: drop-shadow(0 0.2rem 0.4rem rgba(0, 0, 0, 0.5));
            transform: translate(0, -0.15rem);
            transition: all 0.3s ease 0s;
        }

        .module-filler {
            height: 3rem;

            display: flex;
            flex-direction: column;
        }

        .module-details {
            width: 100%;
            height: 100%;
            padding: 1rem 1rem;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
        }

        .module-menu-title,
        .module-menu-progress {
            color: #FFFFFF;
            margin: 0;
            padding: 0;
            font-family: Alexandria, sans-serif;
            font-weight: 500;
            text-align: left;
        }

        .module-menu-title {
            width: 100%;
            height: auto;

            font-size: 1rem;
            font-weight: 500;
            text-wrap: wrap;
            line-height: 1;
            box-orient: vertical;
            line-clamp: 2;

            overflow: hidden;
            text-overflow: ellipsis;

            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
        }


        .module-menu-progress {
            font-size: 0.8rem;
            font-weight: 300;

            height: auto;
            text-wrap: wrap;

            line-height: 1;
            box-orient: vertical;
            line-clamp: 2;

            overflow: hidden;
            text-overflow: ellipsis;

            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
        }

        .long-quiz-display-box {
            padding-bottom: 2rem;
        }

        h5 {
            font-family: Alata, sans-serif;
        }
    </style>
</head>

<body>
    <?php
    include('partials/navibar.php');
    include('partials/time-lock-check-modules.php');
    ?>

    <div class="home-tutor-screen">
        <div class="home-tutor-main">
            <div class="home-tutor-courses-header">
                <h5>Modules</h5>
                <div class="back-button-container">
                    <?= '<a class="activity-link" href="/home-tutor"> ' ?>
                    <div class="back-button"><- BACK to Courses</div>
                    </a>
                </div>
            </div>
            <hr>
            <div class="module-display-flex-box">
                <?php if ($course->modules->isEmpty()): ?>
                    <p>No modules available for this course.</p>
                <?php else: foreach ($course->modules as $module) {
                        if (!$module->moduleimage?->image) {
                            $backgroundImage = "/uploads/course/math.jpg";
                        }
                        $blobData = $module->moduleimage?->image;
                        if (!$blobData) {
                            $backgroundImage = "/uploads/course/math.jpg";
                        } else {
                            $mimeType = getMimeTypeFromBlob($blobData);
                            $base64Image = base64_encode($blobData);
                            $backgroundImage = "data:$mimeType;base64,$base64Image";
                        }

                        echo '<a class="module-link" href="/home-tutor/module/' . $module->module_id . '"><div class="module-menu" style="background-image: url(' . $backgroundImage . ');">
                    <div class="module-filler">
                    </div>
                    <div class="module-details">
                        <div class="module-menu-title">' . $module->module_name . '</div>
                        <div class="module-menu-progress">Progress: ' . $module->module_id . '</div>
                    </div>
                </div></a>

                        ';
                    };
                endif; ?>

            </div>
            <div class="long-quiz-display-box">
                <h5>Long Quizzes</h5>
                <?php foreach ($course->longquizzes as $longquiz) {
                    include('partials/time-lock-check-modules.php');
                    include('partials/quiz-long-hero.php');
                }; ?>
            </div>
            <h5>Screening Tests</h5>
            <hr>
            <div class="featured-module">

            </div>

        </div>
        <?php include('partials/right-side-notifications.php'); ?>
    </div>
</body>
</html>