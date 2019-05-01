<?php
$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'modules' => [
        'gridview' =>  [
            'class' => '\kartik\grid\Module',
        ],
    ],
    'components' => [
        'request' => [
            'class' => 'common\components\Request',
            'web'=> '/frontend/web',
            'csrfParam' => '_csrf-frontend',
        ],
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-frontend', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the frontend
            'name' => 'advanced-frontend',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
                'login' => 'site/login',
                //'logout' => 'site/login',
                'signup' => 'site/signup',
                'home' => 'site/index',
                'list-of-classes' => 'site/list-of-classes',
                'activity-view' => 'site/activity-view',
                'employe-dashboard'=>'site/employe-dashboard',
                'employee-portfolio'=>'site/employee-portfolio',
                'students-view'=>'site/students-view',
                'students-list'=>'site/students-list',
                'view-classes'=>'site/view-classes',
                'view-datesheet'=>'site/view-datesheet',
                
                'attendance' => 'std-attendance',
                'student-attendance' => 'std-attendance/attendance',
                'class-attendance' => 'std-attendance/view-class-attendance',
                'view-attendance' => 'std-attendance/view-attendance',
                'test-attendance' => 'std-attendance/test-attendance',
                'take-attendance' => 'std-attendance/take-attendance',
                'datewise-class-attendance' => 'std-attendance/datewise-class-attendance',
                'datewise-student-attendance' => 'std-attendance/datewise-student-attendance',
                'daterangewise-class-attendance' => 'std-attendance/daterangewise-class-attendance',
                'daterangewise-student-attendance' => 'std-attendance/daterangewise-student-attendance',
                'monthly-attendance-view' => 'std-attendance/monthly-attendance-view',
                'marks-sheet'=>'marks-details/marks-sheet',
                'view-marks-list'=>'marks-details/view-marks-list',
                'emp-leave'=>'emp-leave/index',
                'std-profile'=>'site/std-profile',
                'std-fee'=>'site/std-fee',
                'std-fee-details'=>'site/std-fee-details',
                'std-exams'=>'site/std-exams',
                'std-exam-schedule'=>'site/std-exam-schedule',
                'std-exam-result'=>'site/std-exam-result',
                'children'=>'site/children',
                'premium-version'=>'site/premium-version',
                'fee-details'=>'site/fee-details',
                'dates'=>'site/dates',
                'fetch-days-count'=>'emp-leave/fetch-days-count',
            ],
        ],
        
    ],
    'params' => $params,
];
