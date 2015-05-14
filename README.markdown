# PagerDuty agent Puppet Module

[![Build Status](https://travis-ci.org/walkamongus/puppet-pdagent.svg?branch=master)](https://travis-ci.org/walkamongus/puppet-pdagent)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with pdagent](#setup)
    * [What pdagent affects](#what-pdagent-affects)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This module installs and enables the PagerDuty agent.

## Module Description

The PagerDuty agent is a daemon that enables PagerDuty integration with system and monitoring utilities. This module installs required repositories followed by the PagerDuty agent. It then enables the pdagent service and ensures the daemon is running.

## Setup

### What pdagent affects

* Repositories
    * APT/YUM PagerDuty repositories
* Packages
    * pdagent
    * pdagent-integrations
* Services
    * pdagent daemon

## Usage

Install the PagerDuty agent and ensure the pdagent service is running

    class { '::pdagent': }

## Limitations

Supports Puppet:
* >= 3.5.1

This module has been tested on:
* RedHat 6,7
* Debian 6,7
* Ubuntu 14.04

