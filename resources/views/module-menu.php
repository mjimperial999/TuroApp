<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $course->course_name; ?> - Modules | Turo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <style>
        html,
        body {
            width: 100%;
            height: 100%;
            margin: 0 auto;

            position: relative;
        }

        h4 {
            font-family: Alata, sans-serif;
        }
        
        .featured-module {
            width: 26rem;
            height: 15rem;
            padding: 0;
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
            margin-top: 1rem;
            padding: 1rem 0;
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
            height: 9rem;
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
            height: 6rem;
            padding: 1rem 1rem;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .module-header {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: flex-end;
        }

        .module-teacher {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            justify-content: flex-end;
        }

        .module-title,
        .module-desc {
            color: #FFFFFF;
            margin: 0;
            padding: 0;
            font-family: Alexandria, sans-serif;
            font-weight: 500;
        }

        .module-desc {
            font-size: 0.8rem;
            font-weight: 300;
        }

        h5 {
            font-family: Alata, sans-serif;
        }
    </style>
</head>

<body>
    <?php include('partials/navibar.php'); ?>

    <div class="home-tutor-screen">
        <div class="home-tutor-main">
            <h5>Continue Where You've Left Off</h5>
            <hr>
            <div class="featured-module">

            </div>

            <div class="module-display-flex-box">
                <?php if ($course->modules->isEmpty()): ?>
                    <p>No modules available for this course.</p>
                <?php else: foreach ($course->modules as $module) {
                        echo '<a class="module-link" href="/home-tutor/module/' . $module->module_id . '"><div class="module-menu" style="background-image: url(' . "'/uploads/module/module1.jpeg'" . ');">
                    <div class="module-filler">
                    </div>
                    <div class="module-details">
                        <div class="module-header">
                            <h6 class="module-title">' . $module->module_name . '</h6>
                            <h6 class="module-desc">' . $module->module_description . '</h6>
                        </div>
                        <div class="module-teacher">
                            <h6 class="module-desc">'. $module->module_id . '</h6>
                        </div>
                    </div>
                </div></a>

                        ';
                    };
                endif; ?>

            </div>

        </div>
        <?php include('partials/right-side-notifications.php'); ?>
    </div>
</body>

</html>