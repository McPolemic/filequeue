

## FileQueue [![Build Status](https://travis-ci.org/mcpolemic/filequeue.svg)](https://travis-ci.org/mcpolemic/filequeue)
...is a simple file based queue written in Ruby that uses the Ruby `File` class in standard library to push and pop items into a queue. It's not web scale but is nice for lightweight async queuing apps.

Originally written by [daddz](http://www.github.com/daddz) and found in [this gist](https://gist.github.com/352509). Thanks, daddz!

## Install

    gem install filequeue

## Usage

    queue = FileQueue.new 'queue_party.txt'
    
    queue.push "an item"
      => true
      
    queue.pop
      => "an item"
      
See `spec/filequeue_spec.rb` for more usage details

## Continuous Integration

[![Build Status](http://travis-ci.org/mcpolemic/filequeue.png)](http://travis-ci.org/mcpolemic/filequeue)
