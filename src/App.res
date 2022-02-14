open IHPBackend

@react.component
let make = () => {
    let tasks = useQuery(
        queryTasks
            ->orderByCreatedAt
            ->whereTitle("test")
            ->limit(10)
    );

    <IHPBackend>
        {switch tasks {
            | Some(tasks) => Belt.Array.map(tasks, task => {
                    <Task key={task.id} task/>
                })->React.array
            | None => React.string("loading")
        }}

        <hr />
        <NewTask/>
    </IHPBackend>
}