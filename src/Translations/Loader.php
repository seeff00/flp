<?php

namespace App\Translations;

use Symfony\Component\Yaml\Yaml;

class Loader
{
    const translationFile = __DIR__."/../../translations/messages.bg.yaml";

    /**
     * @return array
     */
    public static function getAll(): array
    {
        return Yaml::parseFile(self::translationFile);
    }

    public static function getByKey(string $key): string
    {
        $translations = Yaml::parseFile(self::translationFile);

        return $translations[$key];
    }
}