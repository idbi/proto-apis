# Project Name

A brief description of your project.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [API Definitions](#api-definitions)
- [Building and Running](#building-and-running)
- [Contributing](#contributing)
- [License](#license)

## Overview

Provide a high-level overview of your project, its purpose, and any key features.

## Prerequisites

List any prerequisites or dependencies that users need to install before they can use your project. Include links or instructions for installation if necessary.

## Getting Started

Explain how users can get started with your project. Include steps for cloning the repository, installing dependencies, and any initial setup.

```bash
git submodule add https://github.com/gsols/proto-apis.git proto
```

## API Definitions

This project uses Protocol Buffers (proto) for API definitions. Protocol Buffers is a language-agnostic data serialization format used for communication protocols. API definitions can be found in the `proto` directory.

### Example API Definition

```proto
// sample.proto

syntax = "proto3";

package yourproject;

message Request {
  string field1 = 1;
  int32 field2 = 2;
}

message Response {
  string result = 1;
}

service YourService {
  rpc YourMethod (Request) returns (Response);
}
```

For a detailed guide on how to write proto files, refer to the Protocol Buffers Documentation.

