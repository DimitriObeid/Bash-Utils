#!/usr/bin/env awk

BEGIN
{
	FILE_NAME=ARGV[1]
	LANG=ARGV[2]
}

{
    for (i=0; i < LANG[i]; i++)
        lang_index++
}

END
{

}
