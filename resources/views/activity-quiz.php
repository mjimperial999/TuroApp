<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $activity->activity_name ?> | Turo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
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
    include('partials/quiz-type-check.php');
    include('partials/time-lock-check.php');
    include('partials/time-limit-conversion.php');
    include('partials/score-calc.php');
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
                                    <img class="svg" src="/icons/<?= $class ?>.svg" width="50em" height="auto" />
                                </div>
                                <div class="heading-context">
                                    <h5><b><?= $activity->activity_name ?></b></h5>
                                    <p><?= $quiz_type ?></p>
                                </div>
                            </div>
                            <div class="return-prev-container">
                                <?= '<a class="activity-link" href="/home-tutor/module/' . $activity->module_id . '/"> ' ?>
                                <div class="return-prev"><- BACK to Module Page</div>
                                        </a>
                                </div>
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
                        <div class="module-section quiz-background-container <?= $class ?>">
                            <div class="module-section quiz-header">
                                <div class="quiz-description">
                                    <div class="quiz-categories-top">
                                        <div class="quiz-categories">
                                            <div class="quiz-categories-desc">
                                                <p class="description"><b>QUESTIONS: </b><?= $activity->quiz->number_of_questions ?></p>
                                                <p class="description"><b>TOTAL ATTEMPTS: </b><?= $activity->quiz->number_of_attempts ?></p>
                                                <p class="description"><b>TIME LIMIT: </b><?= $fTimeLimit ?> min/s</p>
                                            </div>
                                        </div>
                                        <div class="quiz-categories">
                                            <div class="quiz-categories-desc">
                                                <p class="description"><b>OPENS: </b><?= $formattedUnlockDate ?></p>
                                                <p class="description"><b>DUE: </b><?= $formattedDeadline ?></p>
                                            </div>
                                        </div>
                                        <br>
                                    </div>
                                    <hr>
                                    <p class="description">Instructions: <?= $activity->activity_description ?></p>
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
                            <div class="module-section quiz-button-section">
                                <?= '<a class="activity-link" href="/home-tutor/quiz/' . $activity->activity_id . '/s"> ' ?>
                                <div class="quiz-button activity-button <?= $buttonClass ?>">TAKE QUIZ</div>
                                </a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="table-left-padding"></td>
                    <td class="table-right-padding">
                        <div class="module-section">
                            <p class="description" style="color: #492C2C;"><b>ANALYSIS</b></p>
                            <p class="description" style="color: #492C2C;"><b>ATTEMPTS TAKEN: </b><?= $attempts ?></p>
                            <table class="attempts-table">
                                <thead>
                                    <tr class="attempts-table-header" style="background-color: rgba(176, 176, 176, 0.4);">
                                        <th>ATTEMPT</th>
                                        <th>SCORE</th>
                                        <th>PERCENTAGE</th>
                                        <th>DATE TAKEN</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php include('partials/module-quiz-assessments.php'); ?>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>

        </div>
        <?php include('partials/right-side-notifications.php'); ?>
    </div>
</body>
</html>