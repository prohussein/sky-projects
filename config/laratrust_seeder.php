<?php

return [
    /**
     * Control if the seeder should create a user per role while seeding the data.
     */


    'roles_structure' => [
        'super_admin' => [
            'users' => 'c,r,u,d',
            'roles' => 'c,r,u,d',
            'settings' => 'c,r,u,d',
            'categories' => 'c,r,u,d',
            'sliders' => 'c,r,u,d',
            'partners' => 'c,r,u,d',
            'messages' => 'c,r,u,d',
            'products' => 'c,r,u,d',
            'productphotos' => 'c,r,u,d',
            'tags' => 'c,r,u,d',
            'offers' => 'c,r,u,d',
            'pages' => 'c,r,u,d',
            'brands' => 'c,r,u,d',
            'supcategories' => 'c,r,u,d',
            'supsupcategories' => 'c,r,u,d',
            'fairs' => 'c,r,u,d',
            'certificates' => 'c,r,u,d',
            'fairattachments' => 'c,r,u,d',
            'orders' => 'c,r,u,d',
            'expenses' => 'c,r,u,d',
            'expensecategories' => 'c,r,u,d',
            'customers' => 'c,r,u,d',
            'projects' => 'c,r,u,d',
            'subcontractors' => 'c,r,u,d',
            'revenues' => 'c,r,u,d',
            'employees' => 'c,r,u,d',
            'assets' => 'c,r,u,d',
            'safes' => 'c,r,u,d',
            'reports' => 'c,r,u,d',
            'safetransfers' => 'c,r,u,d',

        ],
        'admin' => [],
        'user' => [],
        'account_manager' => [],
        'super_user' => [],
    ],

    'permissions_map' => [
        'c' => 'create',
        'r' => 'read',
        'u' => 'update',
        'd' => 'delete',

    ],
];
