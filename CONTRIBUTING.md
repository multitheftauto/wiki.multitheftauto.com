# Contributing to wiki.multitheftauto.com

Thanks for your interest in contributing to the MTA:SA Lua API documentation!

We are currently restructuring and modernizing how the API is documented in this repository. Please follow the priorities below when contributing.

## 📚 Philosophy & Objective

The goal of this new documentation system is to provide a clean, structured, and authoritative reference for the **MTA:SA Lua API and core engine features only**.

This repository is not intended to serve as a general-purpose wiki or community hub. It will only host official documentation related to:
- Built-in Lua functions
- Events
- Elements and element types
- Data structures and native MTA functionality

We are deliberately excluding community-created content, such as:
- Third-party resources (e.g. DGS, scoreboard, etc.)
- Tutorials, guides, or scripting best practices
- Pages about servers, mods, or other fan-made projects

These kinds of content are valuable to the community, but they will be organized and maintained elsewhere, outside this repository, in a more suitable space (e.g. community wiki, forums, or Discord).

By keeping this documentation focused and consistent, we aim to create a high-quality, structured, and future-proof source of truth for all MTA:SA development.

## 🥇 Priority 1: Finish the Lua API Structure

Help us refine and complete the YAML schema definitions for all API types:
- `functions/`
- `events/`
- `elements/`

The goal is to have a complete **YAML schema** for each API type (function, event, element), with all the necessary information (syntax, notes, return values, code examples, etc.), **ready for automatic generation of documentation pages**. Ensure that the YAML files are well-structured and follow the conventions used in the existing files.

## 🥈 Priority 2: Finish the Site UI and UX

Ensure the site properly renders:
- Function pages
- Event pages
- Element pages
- Code examples and cross-references
- Additional articles

Report issues or inconsistencies in the frontend rendering or contribute layout/fix improvements via pull request.

You may also submit additional site improvements, such as a bookmarks system or other features that enhance user experience.

## 🥉 Later Phase: Port Legacy Wiki Content

Once the structure and display are complete, we’ll begin porting all legacy wiki documentation into YAML format.

This phase is not the current focus, but feel free to experiment or prepare tools/scripts to assist with this process.

## Getting Started

1. Fork the repository
2. Clone your fork (creates a local copy)
3. To work on a contribution, create a new branch for your changes (based on `main`)
4. Make your changes and commit them with a clear message (e.g. `Fix code example display for function pages`)

## Keep in Touch

Join the [MTA Development Discord server](https://forum.multitheftauto.com/topic/133917-our-dedicated-mta-development-discord-server/) and ask for help in the #data-driven-docs channel. We are happy to assist you with any questions or issues you may have while contributing.
