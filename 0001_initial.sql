create table tablesUI_classes
(
    class_name text    not null,
    cathedra   text    not null,
    class_pk   integer not null
        primary key autoincrement
);

create table tablesUI_student
(
    student_pk        integer not null
        primary key autoincrement,
    student_full_name text    not null,
    student_group     text    not null
);

create table tablesUI_studentclasses
(
    class_id_id        integer not null
        references tablesUI_classes
            deferrable initially deferred,
    student_id_id      integer not null
        references tablesUI_student
            deferrable initially deferred,
    student_classes_pk integer not null
        primary key autoincrement
);

create index tablesUI_studentclasses_class_id_id_d80f97cd
    on tablesUI_studentclasses (class_id_id);

create index tablesUI_studentclasses_student_id_id_0204d606
    on tablesUI_studentclasses (student_id_id);

create table tablesUI_task
(
    task_text text    not null,
    max_score real    not null,
    task_pk   integer not null
        primary key autoincrement
);

create table tablesUI_classestask
(
    class_id_id     integer not null
        references tablesUI_classes
            deferrable initially deferred,
    task_id_id      integer not null
        references tablesUI_task
            deferrable initially deferred,
    classes_task_pk integer not null
        primary key autoincrement
);

create index tablesUI_classestask_class_id_id_1f73deed
    on tablesUI_classestask (class_id_id);

create index tablesUI_classestask_task_id_id_5eef0f7b
    on tablesUI_classestask (task_id_id);

create table tablesUI_teacher
(
    teacher_full_name text    not null,
    teacher_pk        integer not null
        primary key autoincrement
);

create table tablesUI_gradedtask
(
    class_task_id_id        integer not null
        references tablesUI_classestask
            deferrable initially deferred,
    graded_by_teacher_id_id integer not null
        references tablesUI_teacher
            deferrable initially deferred,
    student_id_id           integer not null
        references tablesUI_student
            deferrable initially deferred,
    graded_task_pk          integer not null
        primary key autoincrement
);

create index tablesUI_gradedtask_class_task_id_id_098b2f48
    on tablesUI_gradedtask (class_task_id_id);

create index tablesUI_gradedtask_graded_by_teacher_id_id_fb3ca5e9
    on tablesUI_gradedtask (graded_by_teacher_id_id);

create index tablesUI_gradedtask_student_id_id_26e2a64c
    on tablesUI_gradedtask (student_id_id);

create table tablesUI_workload
(
    class_id_id   integer not null
        references tablesUI_classes
            deferrable initially deferred,
    teacher_id_id integer not null
        references tablesUI_teacher
            deferrable initially deferred,
    workload_pk   integer not null
        primary key autoincrement
);

create index tablesUI_workload_class_id_id_58557161
    on tablesUI_workload (class_id_id);

create index tablesUI_workload_teacher_id_id_76868b83
    on tablesUI_workload (teacher_id_id);

