﻿using System;
using System.Collections.Generic;

namespace tvz2api
{
    public partial class StudentKolegij
    {
        public int Id { get; set; }
        public int? StudentId { get; set; }
        public int? KolegijId { get; set; }

        public virtual Kolegij Kolegij { get; set; }
        public virtual Student Student { get; set; }
    }
}
