---
name: Development Workflow Preferences
description: How the user prefers to work with Claude Code skills and agents
type: feedback
---

User uses `/implement` skill for building Figma screens — no need to manually invoke `@frontend-developer` agent. The skill handles agent delegation internally.

**Why:** User asked whether they needed to call @frontend-developer explicitly — they do not. `/implement` is the correct entry point.

**How to apply:** When implementing screens/components, use `/implement [screen or node]`. Only spawn `frontend-developer` agent directly if the skill isn't appropriate for the task.
