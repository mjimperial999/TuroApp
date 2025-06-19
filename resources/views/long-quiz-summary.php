<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $longquiz->long_quiz_name ?> | Turo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <style>
        table,
        th,
        td {
            border: 0.04em solid #C9C9C9;
            border-collapse: collapse;
        }

        table {
            width: 100%;
        }

        .table-left-padding {
            width: 2em;
        }

        .table-right-padding {
            padding: 1em 1.5em;
        }

        .quiz-header {
            padding: 1rem 0;
            align-items: center;
        }

        .quiz-summary-container {
            display: flex;
            flex-direction: column;
        }

        .quiz-points-container {
            display: flex;
            flex-direction: column;
        }

        .quiz-summary-score-details {
            width: 100%;
            display: flex;
            flex-direction: row;
        }

        .quiz-summary-logo-container {
            padding-right: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quiz-summary-logo-container img {
            transform: rotate(6deg);
            filter: drop-shadow(0 0rem 0.1rem rgba(0, 0, 0, 0.2));
        }

        .quiz-summary-score {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .quiz-summary-score .description {
            line-height: 1.2;
            font-size: 1.4rem;
        }

        .description.summary-score {
            font-size: 2.7rem;
        }

        .description.italic {
            font-family: Albert-Sans-IT, sans-serif;
        }

        .quiz-summary-attempts {
            width: 100%;
        }


        @keyframes anim {
            100% {
                stroke-dashoffset: var(--num);
            }
        }
    </style>

</head>

<body>
    <?php
    include('partials/navibar.php');
    include('partials/time-lock-check-modules.php');
    include('partials/score-calc.php');

    $seconds = $longquiz->time_limit;
    $minutes = floor($seconds / 60);
    $fTimeLimit = sprintf("%2d", $minutes);
    ?>

    <div class="home-tutor-screen">
        <div class="home-tutor-main">
            <table>
                <tr class="module-title">
                    <th class="table-left-padding"></th>
                    <th class="table-right-padding">
                        <div class="first-th">
                            <div class="module-heading">
                                <div class="module-logo">
                                    <img class="svg" src="/icons/long-quiz.svg" width="50em" height="auto" />
                                </div>
                                <div class="heading-context">
                                    <h5><b><?= $longquiz->long_quiz_name ?></b></h5>
                                    <p>Long Quiz</p>
                                </div>
                            </div>
                            <div class="back-button-container">
                                <?= '<a class="activity-link" href="/home-tutor/long-quiz/' . $course->course_id . '/' . $longquiz->long_quiz_id . '/"> ' ?>
                                <div class="back-button"><- BACK to <?= $longquiz->long_quiz_name ?> page</div>
                                </a>
                            </div>
                        </div>
                    </th>
                </tr>
                <tr>
                    <td class="table-left-padding"></td>
                    <td class="table-right-padding">
                        <?php if (session()->has('error')): ?>
                            <div class="alert alert-danger alert-message" role="alert">
                                <?= session('error') ?>
                            </div>
                        <?php elseif (session()->has('success')): ?>
                            <div class="alert alert-success alert-message" role="alert">
                                <?= session('success') ?>
                            </div>
                        <?php endif; ?>
                        <div class="module-section quiz-background-container long-quiz">
                            <div class="module-section quiz-header">
                                <div class="quiz-summary-container">
                                    <div class="quiz-summary-score-details">
                                        <div class="quiz-summary-logo-container">
                                            <img class="svg" src="/icons/long-quiz.svg" width="90em" height="auto" />
                                        </div>
                                        <div class="quiz-summary-score">
                                            <p class="description"><b>SCORE: </b></p>
                                            <p class="description summary-score"><b><?= $assessment->earned_points . ' / ' . $longquiz->number_of_questions ?></b></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="quiz-points-container">
                                    <div class="quiz-points-details">
                                        <p class="description">POINTS GARNERED: <b><?= ($assessment->earned_points * 10) ?></b></p>
                                        <p class="description italic">You got <?= ($assessment->earned_points * 10) ?> points for getting <?= $assessment->earned_points ?> correct answers.</p>
                                        <hr>
                                        <p class="description"><b>SCORE CONDITIONS: </b></p>
                                        <p class="description"><b>SCORE X 10 = POINTS </b></p>
                                        <p class="description"><b><?= ($assessment->earned_points) ?></b> X 10 = <b><?= ($assessment->earned_points * 10) ?></b></p>
                                    </div>
                                </div>
                                <div class="quiz-graphics">
                                    <div class="percentage-container">
                                        <div class="percent" style="--clr:<?= $color ?>; --num:<?= $circle_display ?>">
                                            <svg>
                                                <circle cx="70" cy="70" r="70"></circle>
                                                <circle cx="70" cy="70" r="70"></circle>
                                            </svg>
                                        </div>
                                        <div class="percent-number">
                                            <h1><?= $percentage_display ?><span>%</span></h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr style="width: 100%;">
                            <div class="module-section quiz-summary-attempts">
                                <p class="description"><b>ATTEMPT HISTORY</b></p>
                                <table class="attempts-table">
                                    <?php foreach ($assessDisplay as $index => $a): ?>
                                        <tr>
                                            <td><b><?= 'Attempt ' . ($index + 1) ?></b></td>
                                            <td><?= $a->earned_points . ' / ' . $longquiz->number_of_questions ?></td>
                                            <td><?= $a->score_percentage ?>%</td>
                                            <td><?= date('F j, Y h:i A', strtotime($a->date_taken)) ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </table>
                            </div>
                            <hr style="width: 100%;">
                        </div>
                    </td>
                </tr>
            </table>

        </div>
        <?php include('partials/right-side-notifications.php'); ?>
    </div>
</body>
</html>