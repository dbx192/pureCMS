<?php
/**
 * Here is your custom functions.
 */

 if (!function_exists('csrf_token')) {
    /**
     * 获取CSRF令牌
     *
     * @return string
     */
    function csrf_token()
    {
        return session('csrf_token');
    }
}

if (!function_exists('csrf_field')) {
    /**
     * 生成CSRF隐藏字段
     *
     * @return string
     */
    function csrf_field()
    {
        return '<input type="hidden" name="_token" value="' . csrf_token() . '">';
    }
}