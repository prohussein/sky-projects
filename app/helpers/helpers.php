<?php

/*
  return string route name for active class

*/


function lang()
{
    $lang =  LaravelLocalization::getCurrentLocale();
    return $lang;
}
function is_expanded(string $routeName)
{

    return null !== request()->segment(3) && request()->segment(3) == $routeName ? 'is-expanded' : '';
}
function isCreated()
{

    if (config('app.locale') == 'ar') {
        $notification = array(
            'message' => 'تم الاضافة بنجاح',
            'alert-type' => 'success'
        );
    } else {
        $notification = array(
            'message' => 'Created Successfully',
            'alert-type' => 'success'
        );
    }

    return $notification;
}

function noMoneyInSafe()
{


        $notification = array(
            'message' => 'لا يوجد رصيد كافي داخل الخزنة  ',
            'alert-type' => 'error'
        );


    return $notification;
}


function isOverAmount()
{

    if (config('app.locale') == 'ar') {
        $notification = array(
            'message' => 'القيمة المراد تحويلها غير متاحة  ',
            'alert-type' => 'error'
        );
    } else {
        $notification = array(
            'message' => 'No money',
            'alert-type' => 'error'
        );
    }

    return $notification;
}
function isUpdated()
{
    if (config('app.locale') == 'ar') {
        $notification = array(
            'message' => 'تم التعديل بنجاح',
            'alert-type' => 'success'
        );
    } else {
        $notification = array(
            'message' => 'Updated Successfully',
            'alert-type' => 'success'
        );
    }

    return $notification;
}
function notFound()
{
    if (config('app.locale') == 'ar') {
        $notification = array(
            'message' => 'الملف غير موجود  ',
            'alert-type' => 'error'
        );
    } else {
        $notification = array(
            'message' => 'File Not Found ',
            'alert-type' => 'error'
        );
    }

    return $notification;
}

function isDeleted()
{
    if (config('app.locale') == 'ar') {
        $notification = array(
            'message' => 'تم حذف البيانات بنجاح',
            'alert-type' => 'success'
        );
    } else {
        $notification = array(
            'message' => 'Deleted Successfully',
            'alert-type' => 'success'
        );
    }

    return $notification;
}
function isExsit()
{
    if (config('app.locale') == 'ar') {
        $notification = array(
            'message' => 'السجل موجود بالفعل',
            'alert-type' => 'warning'
        );
    } else {
        $notification = array(
            'message' => 'Record already exists',
            'alert-type' => 'warning'
        );
    }

    return $notification;
}
function isSend()
{

    if (config('app.locale') == 'ar') {
        $notification = array(
            'message' => 'تم ارسال رسالتك وسوف يتم التواصل معكم قريبا',
            'alert-type' => 'success'
        );
    } else {
        $notification = array(
            'message' => 'Send Successfully',
            'alert-type' => 'success'
        );
    }

    return $notification;

}
function is_active(string $routeName){

    return null !== request()->segment(3) && request()->segment(3) == $routeName ? 'active' : '' ;

}// end is_active

function getYoutubeId($url)
{
    preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $url, $match);
    return isset($match[1]) ? $match[1] : null;
}

function slug(string $name){
    return strtolower(trim(str_replace(' ' , '_'  ,$name)));
}

function maxId ($model){
    $max =  $model::max('id');
    return $max + 1;
}


?>
