﻿using System;
using System.Collections.Generic;

namespace tvz2api_cqrs.Models
{
    public partial class DiscussionCommentAttachment
    {
        public int Id { get; set; }
        public int? FileId { get; set; }
        public int? DiscussionCommentId { get; set; }
    }
}