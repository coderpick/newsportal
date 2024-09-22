<?php

function validate($data)
{
    $data = trim($data);
    $data = stripcslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

function str_limit($string, $limit = 20)
{
    if (str_word_count($string, 0) > $limit) {
        $words = str_word_count($string, 2);
        $pos = array_keys($words);
        $string = substr($string, 0, $pos[$limit]) . '...';
    }
    return $string;
}
