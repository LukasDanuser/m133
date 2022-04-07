<?php

require_once $_SERVER['DOCUMENT_ROOT'] . '/src/utils.php';

use League\CommonMark\Environment\Environment;
use League\CommonMark\Extension\CommonMark\CommonMarkCoreExtension;
use League\CommonMark\Extension\GithubFlavoredMarkdownExtension;
use League\CommonMark\Extension\HeadingPermalink\HeadingPermalinkExtension;
use League\CommonMark\Extension\HeadingPermalink\HeadingPermalinkRenderer;
use League\CommonMark\MarkdownConverter;

function get()
{
    $environment = new Environment([
        'heading_permalink' => [
            'html_class' => 'heading-permalink',
            'id_prefix' => 'content',
            'fragment_prefix' => 'content',
            'insert' => 'after',
            'min_heading_level' => 1,
            'max_heading_level' => 6,
            'title' => 'Permalink',
            'symbol' => HeadingPermalinkRenderer::DEFAULT_SYMBOL,
            'aria_hidden' => true,
        ],
    ]);
    $environment->addExtension(new CommonMarkCoreExtension());
    $environment->addExtension(new GithubFlavoredMarkdownExtension());
    $environment->addExtension(new HeadingPermalinkExtension());

    $converter = new MarkdownConverter($environment);
    $file = get_asset('/assets/md/' . $_GET['file']);
    echo $converter->convert($file);

    return (object)[
        'title' => 'Markdown',
        'usesLayout' => true,
    ];
}
