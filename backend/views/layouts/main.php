<?php

/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title>SMART EDUCATION</title>
    <?php $this->head() ?>
    <link rel="shortcut icon" href="images/logo.jpg" type="image/jpg">
    <style>
        .nav{
            background-color: #5FDAF4;
        }
        .nav a{
            color: #000;
        }
    </style>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => "<b>SMART EDUCATION</b>",
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'nav',
        ],
    ]);
    $menuItems = [
        ['label' => 'Home', 'url' => ['/site/index']],
        ["label" => "System Configuration",
            "url" => "#",
            "icon" => "fab fa-stumbleupon-circle",
            "items" => [
                [
                    "label" => "Branches",
                    "url" => "index.php?r=branches",
                ],
                [
                    "label" => "Session",
                    "url" => "index.php?r=std-sessions",
                ],
                [
                    "label" => "Section",
                    "url" => "index.php?r=std-sections",
                ],
                [
                    "label" => "Subjects",
                    "url" => "index.php?r=subjects",
                ],
                [
                    "label" => "Class",
                    "url" => "index.php?r=std-class", 
                ],
            ],
        ],
        ["label" => "Student Registration",
            "url" => "#",
            "icon" => "fab fa-stumbleupon-circle",
            "items" => [
                [
                    "label" => "Student Personal Info",
                    "url" => "index.php?r=std-personal-info",
                ],
                [
                    "label" => "Student Guardian Info",
                    "url" => "index.php?r=std-guardian-info",
                ],
                [
                    "label" => "Student Academic Info",
                    "url" => "index.php?r=std-academic-info",
                ],
                [
                    "label" => "Student Class",
                    "url" => "index.php?r=std-class",
                ],
                [
                    "label" => "Student Fee Details",
                    "url" => "index.php?r=std-fee-details",
                ],
                [
                    "label" => "Student Enrollment Head",
                    "url" => "index.php?r=std-enrollment-head",
                ],
                [
                    "label" => "Student Enrollment Detail",
                    "url" => "index.php?r=std-enrollment-detail",
                ],
            ],
        ],
        ["label" => "Employee Registration",
            "url" => "#",
            "icon" => "fab fa-stumbleupon-circle",
            "items" => [
                [
                    "label" => "Employee Info",
                    "url" => "index.php?r=emp-info",
                ],
                [
                    "label" => "Employee Designation",
                    "url" => "index.php?r=emp-designation",
                ],
            ],
        ],
    ];
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
    } else {
        $menuItems[] = '<li>'
            . Html::beginForm(['/site/logout'], 'post')
            . Html::submitButton(
                'Logout (' . Yii::$app->user->identity->username . ')',
                ['class' => 'btn btn-link logout']
            )
            . Html::endForm()
            . '</li>';
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>


<footer class="footer nav">
      <div class="text-center">
        <p style="color: black">
           Copyrights &copy; <?php echo date('Y'); ?>. All Rights Reserved | Powered By: <a href="http://www.dexdevs.com/" target="_blank" style="color: #2452E7"><b>DEXDEVS</b></a>
        </p>
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>


<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
