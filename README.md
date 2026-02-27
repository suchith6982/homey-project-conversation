# Project Conversation History (Rails)

This app implements a Project conversation history where a user can:
- leave a comment
- change the status of the project
- view a combined timeline of both comment events and status-change events

## Assumptions & Questions (and expected answers)

1) What statuses are allowed?
- Assumed: a fixed list: `new`, `in_progress`, `blocked`, `done`.

2) Who can comment / change status?
- Assumed: any authenticated user.

3) Should status changes show from → to?
- Assumed: yes, the timeline records previous + new status.

4) Can comments/statuses be edited/deleted?
- Assumed: no, only creation is required for this task.

## Design

### Conversation History Modeling
A single timeline is implemented using STI:
- `ConversationItem` (base)
  - `CommentItem`
  - `StatusChangeItem`

This allows one feed ordered by `created_at` while supporting multiple event types.

### Status Changes
Status changes are executed via a dedicated action and always write a `StatusChangeItem` entry.

## Setup

### Requirements
- Ruby: 4.0.1
- Rails: 8.1.2
- Database: PostgreSQL

### Install
```bash
bundle install
bin/rails db:create db:migrate db:seed
bin/rails server
