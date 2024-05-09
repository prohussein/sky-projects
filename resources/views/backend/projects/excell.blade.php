



                            @if ($rows->count() > 0)
                                <table>
                                    <thead>
                                        <tr>
                                            <th rowspan="2">#</th>
                                            <th rowspan="2">اسم المشروع </th>
                                            <th rowspan="2">الكود</th>
                                            <th rowspan="2" >العميل  </th>
                                            <th rowspan="2" >تاريخ البداية  </th>
                                            <th rowspan="2" >تاريخ الانتهاء </th>
                                            <th rowspan="2" >تكلفة العميل  {{ number_format($rows->sum('customer_cost') )}} </th>
                                            <th rowspan="2" >التكلفة المتوقعة  {{ number_format($rows->sum('estimated_cost')) }} </th>
                                            <th colspan="4" >عناصر تكاليف المشروع</th>
                                            <th rowspan="2" >اجمالي التكاليف  {{ number_format($rows->pluck('expenses')->flatten()->sum('amount')) }}</th>
                                            <th rowspan="2" >نسبة الانجاز</th>
                                            <th colspan="3" >الايرادات </th>
                                            <th colspan="2" >ربح العملية</th>


                                        </tr>
                                        <tr>

                                            <th > المواد
                                                {{ number_format($rows->pluck('expenses')->flatten()->where('type', 'materials')->sum('amount')) }}
                                            </th>
                                            <th >مقاولين الباطن
                                                {{ number_format($rows->pluck('expenses')->flatten()->where('type', 'subcontractor')->sum('amount')) }}
                                            </th>
                                            <th>الاجور 
                                                {{ number_format($rows->pluck('expenses')->flatten()->where('type', 'tempwages')->sum('amount')) }}
                                            </th>
                                            <th >مصروفات اخري
                                                {{ number_format($rows->pluck('expenses')->flatten()->where('type', 'other')->sum('amount')) }}
                                            </th>

                                            <th >اجمالي
                                                {{ number_format($rows->pluck('revenues')->flatten()->sum('total_amount')) }}

                                            </th>
                                            <th >الاستقطاعات
                                                {{ number_format($rows->pluck('revenues')->flatten()->sum('tax_amount')) }}

                                            </th>
                                            <th >الصافي
                                                {{ number_format($rows->pluck('revenues')->flatten()->sum('net_amount')) }}

                                            </th>

                                            <th >ربح متوقع cust - estim

                                                {{ number_format($rows->sum('customer_cost') - $rows->sum('estimated_cost')) }}
                                            </th>
                                            <th >ربح فعلي
                                                {{ number_format($rows->pluck('revenues')->flatten()->sum('net_amount')  - $rows->pluck('expenses')->flatten()->sum('amount') ) }}
                                            </th>



                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($rows as $index=>$row)
                                        <tr>
                                            <td >{{ $index+1 }}</td>
                                            <td > {{ $row->name }} </td>
                                            <td > {{ $row->code }} </td>
                                            <td > {{ $row->customer->name ?? '' }} </td>
                                            <td > {{ $row->start_date }} </td>
                                            <td > {{ $row->end_date }} </td>
                                            <td > {{ $row->customer_cost }} </td>
                                            <td > {{ $row->estimated_cost }} </td>

                                            <td>
                                                @php $totalMaterials = 0; @endphp
                                                @foreach($row->expenses as $expense)
                                                    @if($expense->type === 'materials')
                                                        @php
                                                            $totalMaterials += $expense->amount;
                                                        @endphp
                                                    @endif
                                                @endforeach
                                                {{ $totalMaterials }}
                                            </td>
                                            <td>
                                                @php $totalSubcontractor = 0; @endphp
                                                @foreach($row->expenses as $expense)
                                                    @if($expense->type === 'subcontractor')
                                                        @php
                                                            $totalSubcontractor += $expense->amount;
                                                        @endphp
                                                    @endif
                                                @endforeach

                                                {{ $totalSubcontractor }}
                                            </td>
                                            <td>
                                                @php $totalTempwages = 0; @endphp
                                                @foreach($row->expenses as $expense)
                                                    @if($expense->type === 'tempwages')
                                                    @php
                                                            $totalTempwages += $expense->amount;
                                                        @endphp
                                                    @endif
                                                @endforeach
                                                {{ $totalTempwages }}
                                            </td>
                                            <td>
                                                @php $totalOther = 0; @endphp
                                                @foreach($row->expenses as $expense)
                                                    @if($expense->type === 'other')
                                                    @php
                                                            $totalOther += $expense->amount;
                                                        @endphp
                                                    @endif
                                                @endforeach
                                                {{ $totalOther }}
                                            </td>

                                            <td > {{ $row->expenses->sum('amount') }} </td>

                                            <td >
                                                @if ($row->items->sum('total_implement_qty') > 0)
                                                {{ number_format ($row->items->sum('total_implement_qty') / $row->items->sum('item_total') * 100,2)  . ' % ' }}
                                                @else
                                                0 %
                                                @endif


                                            </td>

                                            <td > {{ $row->revenues->sum('total_amount') }}  </td>
                                            <td > {{ $row->revenues->sum('tax_amount') }} </td>
                                            <td > {{ $row->revenues->sum('net_amount') }} </td>

                                            <td > {{ $row->customer_cost - $row->estimated_cost }} </td>
                                            <td > {{ $row->revenues->sum('net_amount')  -  $row->expenses->sum('amount') }} </td>


                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table> {{-- end of table  --}}
                            @endif
