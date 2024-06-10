# README

A prototype for creating dynamic content blocks which are based on a json schema
that works together with ActiveRecord.

## Start

```
gem install bundler
bundle
bin/rails db:setup
rails s
```

## List all content blocks

<http://localhost:3000/content_blocks>

## Get the schema for a content block

<http://localhost:3000/content_blocks/:type/schema>

## New content block with dynamic properties

<http://localhost:3000/content_blocks/new/:type>

## Post content block

<http://localhost:3000/content_blocks/>

```
{
  "content_block"=>{
    "block_type"=>"tax_code",
    "properties"=>{
      "code"=>"32",
      "explanation"=>"2"
    }
}
```
