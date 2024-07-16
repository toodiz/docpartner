#!/bin/bash
php generate_content.php
rm -r .cache
cecil serve
