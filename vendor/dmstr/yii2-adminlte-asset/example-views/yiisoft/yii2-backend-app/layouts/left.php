<?php 

    $userID = Yii::$app->user->id;
    $user = Yii::$app->db->createCommand("SELECT user_photo FROM user WHERE id = $userID")->queryAll();
    // Student Photo...
    $userPhoto = $user[0]['user_photo'];
?>
<style type="text/css">
    .main-sidebar{
        color: #ECF0F5;
        background-color: #001F3F;
    }
    .main-sidebar a{
        color: #ECF0F5;
    }
    a:hover{
        font-weight: bold;
        background-color: #000000;
        color: #ffffff;
    }
</style>
<aside class="main-sidebar">

    <section class="sidebar" style="overflow-y: visible; ">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?php echo '../frontend/web/'.$userPhoto; ?>" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>
                    <?= Yii::$app->user->identity->username ?>
                    <!--  -->
                </p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <!-- <div class="input-group">
                <input type="text" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div> -->
        </form>
        <!-- /.search form -->
        <?php if(Yii::$app->user->can('navigation')){ ?>

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => [
                    // ['label' => 'Menus', 'options' => ['class' => 'header center']],
                    ['label' => 'Home', 'icon' => 'dashboard', 'url' => "./home"],
                    //['label' => 'Gii', 'icon' => 'file-code-o', 'url' => ['/gii']],
                    ['label' => 'Login', 'url' => ["../login"], 'visible' => Yii::$app->user->isGuest],

                    // ------------------------------------------------
                    
                    // ------------------------------------------------
                    // System Configuration start...
                    // [
                    //     'label' => 'System Configuration',
                    //     'icon' => 'cogs',
                    //     'url' => '#',
                    //     'items' => [
                    //         // ['label' => 'Institute', 'icon' => 'caret-right', 'url' => ["/institute"],],
                    //         // ['label' => 'Branches', 'icon' => 'caret-right', 'url' => ["/branches"],],
                    //         // //['label' => 'Departments', 'icon' => 'caret-right', 'url' => ["/departments"],],
                    //         // ['label' => 'Sessions', 'icon' => 'caret-right', 'url' => ["/std-sessions"],],
                    //         // ['label' => 'Sections', 'icon' => 'caret-right', 'url' => ["/std-sections"],],
                    //         //['label' => 'Class', 'icon' => 'caret-right', 'url' => ["/std-class"],],
                    //         // ['label' => 'Students Enrolment', 'icon' => 'caret-right', 'url' => ["/std-enrollment-head"],],
                    //         // ['label' => 'Assign Teacher', 'icon' => 'caret-right', 'url' => ["/teacher-subject-assign-head"],],
                    //     ],
                    // ],
                    // System Configuration close...
                    // ------------------------------------------------
                    // Student Module start...
                    [
                        'label' => 'Students',
                        'icon' => 'users',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Inquiry', 'icon' => 'caret-right', 'url' => ["/std-inquiry"],],
                            ['label' => 'Registration', 'icon' => 'caret-right', 'url' => ["/std-personal-info"],],
                            ['label' => 'Enrollment', 'icon' => 'caret-right', 'url' => ["/std-enrollment-head"],],
                            ['label' => 'Promotion/Demotion', 'icon' => 'caret-right', 'url' => ["./"],],
                            //['label' => 'Promotion/Demotion', 'icon' => 'caret-right', 'url' => ["./std-promote"],],
                            
                            //['label' => 'Class', 'icon' => 'caret-right', 'url' => ["/std-class"],],
                            // ['label' => 'Students Enrolment', 'icon' => 'caret-right', 'url' => ["/std-enrollment-head"],],
                            // ['label' => 'Assign Teacher', 'icon' => 'caret-right', 'url' => ["/teacher-subject-assign-head"],],
                        ],
                    ],
                    
                    // ------------------------------------------------
                    // ------------------------------------------------
                    // Fee Module start...
                    [
                        'label' => 'Fee',
                        'icon' => 'credit-card',
                        'url' => '#',
                        'items' => [
                            //['label' => 'Manage Fee Vouchers', 'icon' => 'caret-right', 'url' => 'index.php?r=fee-transaction-detail',],
                            ['label' => 'Manage Class Account', 'icon' => 'caret-right', 'url' => "./class-account"],
                            ['label' => 'Generate Vouchers', 'icon' => 'caret-right', 'url' => "./fee-transaction-detail-fee-voucher"],
                            ['label' => 'Collect Vouchers', 'icon' => 'caret-right', 'url' => "./fee-transaction-detail-collect-voucher"],
                            ['label' => 'Monthly Collection', 'icon' => 'caret-right', 'url' => "./monthly-voucher"],
                            ['label' => 'Yearly Collection', 'icon' => 'caret-right', 'url' => "./yearly-voucher"],
                            ['label' => 'Class Fee Report', 'icon' => 'caret-right', 'url' => "./fee-transaction-detail-class-account-fee-report"]
                        ],
                    ],
                    // ------------------------------------------------
                    // Fee Module close...
                    // ------------------------------------------------
                    // Exams module start here
                    [
                        'label' => 'Examination',
                        'icon' => 'cog',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Grades', 'icon' => '', 'url' => ["/grades"],],
                            ['label' => 'Exams Category', 'icon' => '', 'url' => ["/exams-category"],],
                            ['label' => 'Marks Weightage', 'icon' => '', 'url' => ["/marks-weitage"],],
                            // ['label' => 'Exams Criteria', 'icon' => 'caret-right', 'url' => ["/exams-criteria"],],
                            // ['label' => 'Exams Schedule', 'icon' => 'caret-right', 'url' => ["/exams-schedule"],],
                            ['label' => 'Manage Exams', 'icon' => '', 'url' => ["/exams-schedule/manage-exams"],],
                            ['label' => 'View Marks Sheet', 'icon' => '', 'url' => ["/view-marks-sheet "],],
                            // ['label' => 'Result cards', 'icon' => '', 'url' => ["/view-result-cards "],],
                            
                        ],
                    ],
                    // Exams module close here
                    // Employee Module start...
                    [
                        'label' => 'Employees',
                        'icon' => 'user-plus',
                        'url' => [""],
                        'items' => [
                            ['label' => 'Employee Registration', 'icon' => 'caret-right', 'url' => './emp-info',],
                            ['label' => 'Assign Teacher', 'icon' => 'caret-right', 'url' => './teacher-subject-assign-head ',]
                        ],
                    ],
                    // ------------------------------------------------
                    // Employee Module close...
                    // ------------------------------------------------
                    // Msg of Day start...
                    [
                        'label' => 'Communications',
                        'icon' => 'comments',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Message of the Day', 'icon' => 'caret-right', 'url' => "./msg-of-day"],
                            ['label' => 'Events Management', 'icon' => 'caret-right', 'url' => "./events"],
                            ['label' => 'Notice Management', 'icon' => 'caret-right', 'url' => "./notice"],
                            ['label' => 'Complaint Box', 'icon' => 'caret-right', 'url' => "./"]
                        ],
                    ],
                    // ------------------------------------------------
                    // Msg of Day close...

                    // ------------------------------------------------
                    // SMS start...
                    [
                        'label' => 'SMS',
                        'icon' => 'comments-o',
                        'url' => '#',
                        'items' => [
                            ['label' => 'SMS Templates', 'icon' => 'caret-right', 'url' => "./sms",],
                            // ['label' => 'Absent Students SMS', 'icon' => 'caret-right', 'url' => "./absent-sms",],
                            ['label' => 'Custom SMS', 'icon' => 'caret-right', 'url' => "./custom-sms",],
                            
                            // ['label' => 'Fee Transaction Details', 'icon' => 'caret-right', 'url' => 'index.php?r=fee-transaction-detail',]
                        ],
                    ],
                    // ------------------------------------------------
                    // SMS close...
                    // ------------------------------------------------
                    // Email start...
                    [
                        'label' => 'Email',
                        'icon' => 'envelope-o',
                        'url' => ["/emails"],
                    ],
                    // Email close...
                     // Account Module start...
                    [
                        'label' => 'Account Module',
                        'icon' => 'credit-card',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Account Head', 'icon' => 'caret-right', 'url' => "./account-register"],
                            ['label' => 'Account Transaction', 'icon' => 'caret-right', 'url' => "./account-transactions"],
                            ['label' => 'Capital', 'icon' => 'caret-right', 'url' => "./"],
                            ['label' => 'Assets', 'icon' => 'caret-right', 'url' => "./"],
                            ['label' => 'Liabilities', 'icon' => 'caret-right', 'url' => "./"],
                            ['label' => 'Revenue', 'icon' => 'caret-right', 'url' => "./"],
                            ['label' => 'Balance Sheet', 'icon' => 'caret-right', 'url' => "./"],
                            ['label' => 'Trial Balance', 'icon' => 'caret-right', 'url' => "./"],
                            ['label' => 'Income Statement', 'icon' => 'caret-right', 'url' => "./"],
                            ['label' => 'Yearly Charts', 'icon' => 'caret-right', 'url' => "./"],
                            ['label' => 'Transaction Logs', 'icon' => 'caret-right', 'url' => "./"]
                        ],
                    ],
                    // ------------------------------------------------
                    // Account Module close...
                    // ------------------------------------------------
                    
                    // System Settings start...
                    [
                        'label' => 'System Settings',
                        'icon' => 'cog',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Institute', 'icon' => 'caret-right', 'url' => ["/institute"],],
                            ['label' => 'Branches', 'icon' => 'caret-right', 'url' => ["/branches"],],
                            //['label' => 'Departments', 'icon' => 'caret-right', 'url' => ["/departments"],],
                            ['label' => 'Sessions', 'icon' => 'caret-right', 'url' => ["/std-sessions"],],
                            ['label' => 'Sections', 'icon' => 'caret-right', 'url' => ["/std-sections"],],
                            ['label' => 'Classes', 'icon' => 'caret-right', 'url' => ["/std-class-name"],],
                            ['label' => 'Subjects', 'icon' => 'caret-right', 'url' => ["/subjects"],],
                            ['label' => 'Subjects Combination', 'icon' => 'caret-right', 'url' => ["/std-subjects"],],
                            ['label' => 'Employee Designation', 'icon' => 'caret-right', 'url' => ["/emp-designation"],],
                            ['label' => 'Employee Type', 'icon' => 'caret-right', 'url' => ["/emp-type"],],
                            ['label' => 'Fee Type', 'icon' => 'caret-right', 'url' => ["/fee-type"],],
                            ['label' => 'Fee Packages', 'icon' => 'caret-right', 'url' => ["/std-fee-pkg"],],
                        ],
                    ],
                    // System Settings close...
                    // ------------------------------------------------

                    // ------------------------------------------------
                    // Multilevel Dropdown....!
                    // [
                    //     'label' => 'Some tools',
                    //     'icon' => 'share',
                    //     'url' => '#',
                    //     'items' => [
                    //         ['label' => 'Gii', 'icon' => 'file-code-o', 'url' => ['/gii'],],
                    //         ['label' => 'Debug', 'icon' => 'dashboard', 'url' => ['/debug'],],
                    //         [
                    //             'label' => 'Level One',
                    //             'icon' => 'circle-o',
                    //             'url' => '#',
                    //             'items' => [
                    //                 ['label' => 'Level Two', 'icon' => 'circle-o', 'url' => '#',],
                    //                 [
                    //                     'label' => 'Level Two',
                    //                     'icon' => 'circle-o',
                    //                     'url' => '#',
                    //                     'items' => [
                    //                         ['label' => 'Level Three', 'icon' => 'circle-o', 'url' => '#',],
                    //                         ['label' => 'Level Three', 'icon' => 'circle-o', 'url' => '#',],
                    //                     ],
                    //                 ],
                    //             ],
                    //         ],
                    //     ],
                    // ],
                ],
            ]
        ) ?>
        <?php } ?>

        <!-- Inquiry Nav Start -->
        <?php if(Yii::$app->user->can('inquiry-nav')){ ?>

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => [
                    ['label' => 'Menus', 'options' => ['class' => 'header center']],
                    ['label' => 'Home', 'icon' => 'dashboard', 'url' => "./home"],
                    //['label' => 'Gii', 'icon' => 'file-code-o', 'url' => ['/gii']],
                    ['label' => 'Login', 'url' => ["../login"], 'visible' => Yii::$app->user->isGuest],

                    // ------------------------------------------------
                    // Student Module start...
                    [
                        'label' => 'Student Module',
                        'icon' => 'users',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Student Inquiry', 'icon' => 'caret-right', 'url' => ["/std-inquiry"],],
                            //['label' => 'Student Registration', 'icon' => 'caret-right', 'url' => ["/std-personal-info"],],
                            //['label' => 'Student Enrollment', 'icon' => 'caret-right', 'url' => ["/std-enrollment-head"],],
                            //['label' => 'Student Promotion', 'icon' => 'caret-right', 'url' => ["./std-promote"],],
                        ],
                    ],
                    
                    // ------------------------------------------------
                    
                ],
            ]
        ) ?>
        <?php } ?>
        <!-- Inquiry Nav end -->

    </section>

</aside>
